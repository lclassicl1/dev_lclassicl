package article.service;

import java.util.List;

import article.model.Article;

public class ArticlePage {
	private int total; //전체게시물수
	private int currentPage; //현재페이지
	private List<Article> content; //게시글 목록 정보(글번호, 제목 , 작성자, 작성일자, 수정일자. 조회수)
	private int totalPages; //총페이지수
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	
	public ArticlePage() {
		
	}

	public ArticlePage(int total, int currentPage, int size, List<Article> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		//전체 게시글수가 없다면, 전체페이지, 시작페이지, 끝페이지도 0으로 설정
		if(total == 0) {
			this.totalPages = 0;
			this.startPage = 0;
			this.endPage = 0;
		} else {
			//0이 아니라면(게시글이 있다면)
			this.totalPages = total / size; //size는 페이징처리시 보여줄 게시글의 수, 전체글 20인데 3개씩보여준다 라고하면 전체페이지는 6페이지 + 나머지 1페이지
			
			//전체 게시물수에서 보여줄 게시글의수를 나눈 나머지의 값이 0보다 크다, 즉 페이징처리후에 남은 글이있다라면
			if(total % size > 0) {
				this.totalPages++; //토탈 페이지를 1 증가(남은 글의 페이지를 추가해주기 위함)
			}
			int modVal = currentPage%5; //
			
			this.startPage = currentPage/5*5+1;
			
			if(modVal == 0) {
				startPage -= 5;
			}
			
			endPage = startPage + 4;
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
		
	}
	
	public boolean hasNoArticles() {
		return this.total == 0;
	}
	
	public boolean hasArticles()	{
		return this.total > 0;
	}
	
	public int getTotal() {
		return total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public List<Article> getContent() {
		return content;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
	
	
}	
