FIND_PACKAGE(CTags)

IF(CTAGS_FOUND)
	SET(CTAGS_EXCLUDES
		*.sip
	)

	SET(CTAGS_IGNORES "BALL_EXPORT,BALL_VIEW_EXPORT")

	SET(EXCLUDES_TMP)
	FOREACH(i ${CTAGS_EXCLUDES})
		SET(EXCLUDES "${EXCLUDES} --exclude=\"${i}\"")
	ENDFOREACH()

	ADD_CUSTOM_COMMAND(
		OUTPUT ${CMAKE_BINARY_DIR}/tags
		COMMAND ${CTAGS_EXECUTABLE} -I ${CTAGS_IGNORES} --languages=+C++ --recurse=yes ${CMAKE_SOURCE_DIR}/source ${CMAKE_SOURCE_DIR}/include
		DEPENDS ${BALL_sources} ${BALL_headers} ${VIEW_sources} ${VIEW_headers}
		WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
	)

	ADD_CUSTOM_TARGET(ctags DEPENDS ${CMAKE_BINARY_DIR}/tags)
ENDIF()
