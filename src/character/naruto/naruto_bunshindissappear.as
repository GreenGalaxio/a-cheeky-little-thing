// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_bunshindissappear

package 
{
    import flash.display.MovieClip;

    public dynamic class naruto_bunshindissappear extends MovieClip 
    {

        public function naruto_bunshindissappear()
        {
            addFrameScript(16, this.frame17);
        }

        internal function frame17():*
        {
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

